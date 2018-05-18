using UnityEngine;
using System.Collections;

public class CameraRotator : MonoBehaviour
{
	private Transform rotationPivot;
	private Rect touchableArea;
	private Vector3 lastTouchPosition;
	private Vector3 cameraTorque;
	private const float ROTATION_SPEED = 0.02f;
	private const float DAMPING = 0.9f;
	private bool touch = false;

    private const float SAFE_AREA_X = 0.2f;
    private const float SAFE_AREA_Y = 0.05f;
    private const float ROTATION_LIMIT = 50.0f;

    void Start ()
	{
		touchableArea = new Rect(Screen.width * SAFE_AREA_X, Screen.height * SAFE_AREA_Y, Screen.width * (1 - SAFE_AREA_X * 2), Screen.height * (1 - SAFE_AREA_Y * 2));
		rotationPivot = Camera.main.transform.parent;
		lastTouchPosition = new Vector2(0, 0);
	}

	void Update ()
	{
		HandleTouching();
		UpdateCamera();
	}

	void HandleTouching()
	{
		if (touch)
		{
			if (touchableArea.Contains(Input.mousePosition))
			{
				Vector3 delta = lastTouchPosition - Input.mousePosition;
				cameraTorque.x += delta.y * ROTATION_SPEED;
				cameraTorque.y -= delta.x * ROTATION_SPEED;
			}
		}
		
		lastTouchPosition = Input.mousePosition;
		touch = Input.GetMouseButton(0);
	}

	void UpdateCamera()
	{
		Vector3 rotationEulerAngles = rotationPivot.localEulerAngles;

		rotationEulerAngles.x += cameraTorque.x;
		rotationEulerAngles.y += cameraTorque.y;
		rotationEulerAngles.z = 0;

		if (rotationEulerAngles.x > ROTATION_LIMIT && rotationEulerAngles.x < 180)
		{
			rotationEulerAngles.x = ROTATION_LIMIT;
		}
		else if (rotationEulerAngles.x >= 180 && rotationEulerAngles.x < (360 - ROTATION_LIMIT))
		{
			rotationEulerAngles.x = (360 - ROTATION_LIMIT);
		}

		rotationPivot.localEulerAngles = rotationEulerAngles;
		cameraTorque *= DAMPING;
	}
}
