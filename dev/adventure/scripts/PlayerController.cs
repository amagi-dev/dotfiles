using Godot;
// using System;

public partial class PlayerController : CharacterBody3D
{
	[Export(PropertyHint.Range, "0.0.2,0.4,0.01")] public float mouseSensitivity = 0.04f;
	[Export(PropertyHint.Range, "1.0f,15.0f,0.1f")] public float moveSpeed = 20.0f;



	private const float gravityForce = 9.8f;

	private Node3D cameraPivot;
	private Camera3D camera;

	private float pitch = 0.0f;

	public override void _Ready()
	{
		cameraPivot = GetNode<Node3D>("CameraPivot");
		camera = cameraPivot.GetNode<Camera3D>("Camera3D");

		Input.MouseMode = Input.MouseModeEnum.Captured;
	}

	public override void _Input(InputEvent @event)
	{

		// マウスボタンが押された瞬間を検出
		if (@event is InputEventMouseButton mouseEvent && mouseEvent.Pressed)
		{
			if (mouseEvent.ButtonIndex == MouseButton.Left)
			{
				Input.MouseMode = Input.MouseModeEnum.Captured;
			}
			else if (mouseEvent.ButtonIndex == MouseButton.Right)
			{
				Input.MouseMode = Input.MouseModeEnum.Captured;
			}

		}


		if (@event is InputEventMouseMotion mouseMotion)
		{
			// マウスで回転
			RotateY(-mouseMotion.Relative.X * mouseSensitivity * 0.01f);

			pitch -= mouseMotion.Relative.Y * mouseSensitivity * 0.01f;
			pitch = Mathf.Clamp(pitch, -Mathf.Pi / 2, Mathf.Pi / 2);
			cameraPivot.Rotation = new Vector3(pitch, 0, 0);
		}

		// ESCキーでマウスを解放
		if (@event.IsActionPressed("ui_cancel"))
		{
			if(Input.MouseMode == Input.MouseModeEnum.Visible)
			{
				GetTree().Quit();
			}
			Input.MouseMode = Input.MouseModeEnum.Visible;
		}
	}

	public override void _PhysicsProcess(double delta)
	{

		Vector3 direction = Vector3.Zero;

		if(Input.IsActionPressed("w"))
		{
			direction -= Transform.Basis.Z;
		}
		else if(Input.IsActionPressed("s"))
		{

			direction += Transform.Basis.Z;
		}

		if(Input.IsActionPressed("a"))
		{
			direction -= Transform.Basis.X;
		}
		else if(Input.IsActionPressed("d"))
		{
			direction += Transform.Basis.X;
		}


		direction = direction.Normalized();

		Velocity = direction * new Vector3(moveSpeed,gravityForce,moveSpeed);
		MoveAndSlide();
	}
}
