using UnityEngine;
using System.Collections.Generic;

public enum ESelectionStatus
{
	eSS_inactive,
	eSS_active,
	eSS_selected
}

public class ShipModule : MonoBehaviour
{
	[SerializeField] private List<string> _possibleNames;
	[SerializeField] private int _level;
	
	private Renderer moduleRenderer;
	private Collider moduleCollider;
	private List<string> possibleNames;

    public int Level
    {
        get { return _level; }
    }

	void Start ()
	{
		moduleRenderer = GetComponent<Renderer>();
		moduleCollider = GetComponent<Collider>();
		possibleNames = _possibleNames;
	}

	public string GetName()
	{
		if (possibleNames.Count <= 0)
		{
			return "";
		}
		return possibleNames[Random.Range(0, possibleNames.Count)];
	}

	public void SetMaterial(Material material)
	{
		moduleRenderer.material = material;
	}

	public void EnableCollider()
	{
		moduleCollider.enabled = true;
	}

	public void DisableCollider()
	{
		moduleCollider.enabled = false;
	}
}
