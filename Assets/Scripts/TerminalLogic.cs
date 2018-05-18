using UnityEngine;
using System.Collections.Generic;

public class TerminalLogic : MonoBehaviour
{
    [SerializeField] private AudioClip _welcomeSound;
    [SerializeField] private AudioClip _levelUpSound;
    [SerializeField] private AudioClip _levelDownSound;
    [SerializeField] private AudioClip _selectSound;
    [SerializeField] private List<ShipModule> _shipModules;
    [SerializeField] private Material _textMaterial;
    [SerializeField] private Material _inactiveMaterial;
    [SerializeField] private Material _activeMaterial;
    [SerializeField] private Material _selectedMaterial;
    [SerializeField] private Sprite _loadingScreen;
    [SerializeField] private Sprite _loadingIcon;
    [SerializeField] private Texture2D _inactiveButtons;
    [SerializeField] private Texture2D _activeButtons;
    [SerializeField] private Font _font;
    [SerializeField] private Color _fontColor;

    private CameraRotator cameraRotator;
    private AudioSource audioSource;
    private List<Rect> buttonRects;
    private Rect loadingScreenRect;
    private Rect loadingIconRect;
    private Rect loadingHeadlineRect;
    private Rect loadingStatusRect;
    private Rect selectedModuleTextRect;
    private GUIStyle style;
    private Vector3 lastTouchPosition;
    private string loadingStatusText;
    private string selectedModuleText;
    private int selectedLevel;
    private float dragDeltaMagnitude;
    private float loadingTimer;
    private float welcomeTimer;
    private float loadingScreenAlpha;
    private float loadingIconTorque;
    private float loadingIconRotation;
    private float loadingIconAlpha;
    private float loadingIconOffset;
    private bool loadingScreenFinished;

    private const float MAX_DRAG_FOR_CLICK = 0.1f;
    private const float LOADING_TIME = 5.0f;
    private const float WELCOME_TIME = 3.0f;
    private const float LOADING_SCREEN_ALPHA_DECREASE = 2.0f;
    private const float LOADING_ICON_SPEED = 1.0f;
    private const float LOADING_ICON_MAX_SPEED = 50.0f;
    private const float LOADING_ICON_ALPHA_INCREASE = 3.0f;
    private const float LOADING_ICON_ALPHA_DECREASE = 0.5f;
    private const float LOADING_ICON_OFFSET_SPEED = 0.03f;
    private const float ONE_THIRD = 1.0f / 3.0f;

    void Start()
    {
        cameraRotator = transform.parent.GetComponent<CameraRotator>();
        cameraRotator.enabled = false;
        audioSource = GetComponent<AudioSource>();
        loadingScreenRect = new Rect(-1, -1, Screen.width + 2, Screen.height + 2);
        loadingIconRect = new Rect(Screen.width * 0.5f - Screen.width * 0.03f, Screen.height * 0.8f - Screen.width * 0.03f, Screen.width * 0.06f, Screen.width * 0.06f);
        loadingHeadlineRect = new Rect(Screen.height * 0.1f, Screen.height * 0.1f, Screen.width, Screen.height);
        loadingStatusRect = new Rect(0, Screen.height * 0.85f, Screen.width, Screen.height * 0.1f);
        selectedModuleTextRect = new Rect(0, Screen.height * 0.1f, Screen.width * 0.9f, Screen.height);
        buttonRects = new List<Rect>();
        for (int i = 0; i < 3; ++i)
        {
            buttonRects.Add(new Rect(Screen.height * 0.02f, Screen.height * 0.02f + (2 - i) * Screen.height * 0.07f, Screen.height * 0.2f, Screen.height * 0.066f));
        }
        _font.material = _textMaterial;
        style = null;
        loadingStatusText = "please wait...";
        selectedModuleText = "";
        selectedLevel = 1;
        lastTouchPosition = Vector3.zero;
        dragDeltaMagnitude = 0.0f;
        loadingTimer = LOADING_TIME;
        welcomeTimer = WELCOME_TIME;
        loadingScreenAlpha = 1.0f;
        loadingIconTorque = 0.0f;
        loadingIconRotation = 0.0f;
        loadingIconAlpha = 0.0f;
        loadingIconOffset = 0.0f;
        loadingScreenFinished = false;
    }

    void SetLevelSelectionStatus(int level, ESelectionStatus selectionStatus)
    {
        foreach (ShipModule module in _shipModules)
        {
            if (module.Level == level)
            {
                if (selectionStatus == ESelectionStatus.eSS_inactive)
                {
                    module.SetMaterial(_inactiveMaterial);
                    module.DisableCollider();
                }
                else
                {
                    module.SetMaterial(_activeMaterial);
                    module.EnableCollider();
                }
            }
        }
    }

    void OnGUI()
    {
        if (style == null)
        {
            style = new GUIStyle(GUI.skin.label);
            style.font = _font;
        }

        Color color = Color.white;

        for (int i = 0; i < buttonRects.Count; ++i)
        {
            if (i == selectedLevel - 1)
            {
                GUI.DrawTextureWithTexCoords(buttonRects[i], _activeButtons, new Rect(0, ONE_THIRD * (2 - i), 1, ONE_THIRD), true);
            }
            else
            {
                GUI.DrawTextureWithTexCoords(buttonRects[i], _inactiveButtons, new Rect(0, ONE_THIRD * (2 - i), 1, ONE_THIRD), true);
            }
        }

        color.r = _fontColor.r * 1.1f;
        color.g = _fontColor.g * 1.1f;
        color.b = _fontColor.b * 1.1f;
        GUI.color = color;
        style.fontSize = 50;
        style.alignment = TextAnchor.UpperRight;
        GUI.Label(selectedModuleTextRect, selectedModuleText, style);

        if (!loadingScreenFinished)
        {
            color = Color.white;
            color.a = loadingScreenAlpha;
            GUI.color = color;
            GUI.DrawTexture(loadingScreenRect, _loadingScreen.texture);

            color.r = _fontColor.r;
            color.g = _fontColor.g;
            color.b = _fontColor.b;
            GUI.color = color;
            style.fontSize = 50;
            style.alignment = TextAnchor.UpperLeft;
            GUI.Label(loadingHeadlineRect, "ISS Auerbach - Map Terminal", style);
            style.fontSize = 20;
            style.alignment = TextAnchor.MiddleCenter;
            GUI.Label(loadingStatusRect, loadingStatusText, style);

            color = Color.white;
            color.a = loadingIconAlpha;
            GUI.color = color;
            GUIUtility.RotateAroundPivot(loadingIconRotation, loadingIconRect.center);
            loadingIconRect.y = Screen.height * 0.8f - Screen.width * 0.03f - loadingIconOffset;
            GUI.DrawTexture(loadingIconRect, _loadingIcon.texture);
        }
    }

    void Update()
    {
        if (!loadingScreenFinished)
        {
            UpdateLoadingScreen();
            return;
        }

        HandleButtonClick();
        HandleDrag();
        HandleModuleClick();
    }

    private void HandleButtonClick()
    {
        if (Input.GetMouseButton(0))
        {
            for (int i = 0; i < buttonRects.Count; ++i)
            {
                Vector3 screenMousePosition = Input.mousePosition;
                screenMousePosition.y = Screen.height - screenMousePosition.y;

                if (buttonRects[i].Contains(screenMousePosition))
                {
                    selectedModuleText = "";
                    if (i + 1 < selectedLevel)
                    {
                        audioSource.PlayOneShot(_levelDownSound);
                    }
                    else if (i + 1 > selectedLevel)
                    {
                        audioSource.PlayOneShot(_levelUpSound);
                    }
                    selectedLevel = i + 1;
                    SetLevelSelectionStatus(0, ESelectionStatus.eSS_active);
                    for (int j = 0; j < buttonRects.Count; ++j)
                    {
                        if (j == i)
                        {
                            SetLevelSelectionStatus(j + 1, ESelectionStatus.eSS_active);
                        }
                        else
                        {
                            SetLevelSelectionStatus(j + 1, ESelectionStatus.eSS_inactive);
                        }
                    }
                    break;
                }
            }
        }
    }

    private void HandleDrag()
    {
        if (Input.GetMouseButtonDown(0))
        {
            lastTouchPosition = Input.mousePosition;
        }
        if (Input.GetMouseButton(0))
        {
            dragDeltaMagnitude += (Input.mousePosition - lastTouchPosition).magnitude;
            lastTouchPosition = Input.mousePosition;
        }
    }

    private void HandleModuleClick()
    {
        if (Input.GetMouseButtonUp(0))
        {
            float tmpDragDeltaMagnitude = dragDeltaMagnitude;
            lastTouchPosition = Vector3.zero;
            dragDeltaMagnitude = 0.0f;
            if (tmpDragDeltaMagnitude >= Screen.height * MAX_DRAG_FOR_CLICK)
            {
                return;
            }
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            Physics.Raycast(ray, out hit);
            if (Physics.Raycast(ray, out hit))
            {
                audioSource.PlayOneShot(_selectSound);
                SetLevelSelectionStatus(0, ESelectionStatus.eSS_active);
                SetLevelSelectionStatus(selectedLevel, ESelectionStatus.eSS_active);
                foreach (ShipModule module in _shipModules)
                {
                    if (module.transform == hit.transform)
                    {
                        module.SetMaterial(_selectedMaterial);
                        selectedModuleText = module.GetName();
                    }
                }
            }
        }
    }

    private void UpdateLoadingScreen()
    {
        if (loadingTimer >= 0)
        {
            loadingTimer -= Time.deltaTime;
            if (loadingTimer <= 0)
            {
                foreach (ShipModule module in _shipModules)
                {
                    if (module.Level == 0 || module.Level == selectedLevel)
                    {
                        module.SetMaterial(_activeMaterial);
                        module.EnableCollider();
                    }
                    else
                    {
                        module.SetMaterial(_inactiveMaterial);
                        module.DisableCollider();
                    }
                }
                audioSource.PlayOneShot(_welcomeSound);
                loadingStatusText = "Welcome [#UNKNOWN_USER_ERROR#]!";
            }
            if (loadingIconAlpha < 1)
            {
                loadingIconAlpha += LOADING_ICON_ALPHA_INCREASE * Time.deltaTime;
                Mathf.Clamp01(loadingIconAlpha);
            }
            if (loadingIconTorque < LOADING_ICON_MAX_SPEED)
            {
                loadingIconTorque += LOADING_ICON_SPEED * Time.deltaTime;
                Mathf.Clamp(loadingIconTorque, 0, LOADING_ICON_MAX_SPEED);
            }
            loadingIconRotation += loadingIconTorque;
        }
        else if (welcomeTimer >= 0)
        {
            welcomeTimer -= Time.deltaTime;
            if (loadingIconTorque > 0)
            {
                loadingIconTorque -= LOADING_ICON_SPEED * Time.deltaTime;
                Mathf.Clamp(loadingIconTorque, 0, LOADING_ICON_MAX_SPEED);
            }
            loadingIconRotation += loadingIconTorque;
            if (loadingIconAlpha > 0)
            {
                loadingIconAlpha -= LOADING_ICON_ALPHA_DECREASE * Time.deltaTime;
                Mathf.Clamp01(loadingIconAlpha);

                loadingIconOffset += Screen.height * LOADING_ICON_OFFSET_SPEED * Time.deltaTime;
            }
        }
        else if (loadingScreenAlpha > 0)
        {
            loadingScreenAlpha -= LOADING_SCREEN_ALPHA_DECREASE * Time.deltaTime;
            if (loadingScreenAlpha <= 0)
            {
                cameraRotator.enabled = true;
                loadingScreenFinished = true;
            }
        }
    }
}
