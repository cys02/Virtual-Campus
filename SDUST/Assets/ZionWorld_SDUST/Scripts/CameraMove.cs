using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMove : MonoBehaviour
{
     //public Transform cameraTransform;

     public GameObject playerView;
    [Header("Control Settings")]
    public float mouseSensitivity = 100.0f;

    private float xRotation = 0f;
    public float angularSpeed = 135;
    //水平视角灵敏度
    public float horizontalRotateSensitivity = 10;
    //垂直视角灵敏度
    public float verticalRotateSensitivity = 5;
 
    //最大俯角
    public float maxDepressionAngle = 90;
 
    //最大仰角
    public float maxElevationAngle = 25;
    
    void Update()
    {
        View();
    }
    void View()
    {
        //锁定鼠标到屏幕中心
        SetCursorToCentre();
 
        //当前垂直角度
        double VerticalAngle = playerView.transform.eulerAngles.x;
        // if(VerticalAngle > maxDepressionAngle && VerticalAngle< 360 - maxElevationAngle)
        // {
        //     playerView.transform.localEulerAngles=new Vector3(0,playerView.transform.eulerAngles.y,playerView.transform.eulerAngles.z);
        // }
 
        //通过鼠标获取竖直、水平轴的值，范围在-1到1
        float h = Input.GetAxis("Mouse X");
        float v = Input.GetAxis("Mouse Y") * -1;
 
        //角色水平旋转
        transform.Rotate(Vector3.up * h * Time.deltaTime * angularSpeed* horizontalRotateSensitivity);
 
        //计算本次旋转后，竖直方向上的欧拉角
        double targetAngle = VerticalAngle + v * Time.deltaTime * angularSpeed * verticalRotateSensitivity;
 
        //竖直方向视角限制
        if (targetAngle > maxDepressionAngle && targetAngle < 360 - maxElevationAngle) return;
 
        //摄像机竖直方向上旋转
        playerView.transform.Rotate(Vector3.right * v * Time.deltaTime * angularSpeed * verticalRotateSensitivity);
    }
 
    void SetCursorToCentre()
    {
        //锁定鼠标后再解锁，鼠标将自动回到屏幕中心
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.lockState = CursorLockMode.None;
        //隐藏鼠标
        Cursor.visible = false;
    }
}
