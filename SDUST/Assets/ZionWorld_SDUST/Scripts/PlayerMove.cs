using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Fungus;

public class PlayerMove : MonoBehaviour
{

    [Header("PlayerControl")]
    public CharacterController controller;
    public Fungus.Flowchart myflowchart;
    Animator animator;
    public float speed = 5f;
    public float gravity =9.8f; 
    private Vector3 move = Vector3.zero;

    
    void Start()
    {
        // Debug.Log("1");
        controller = GetComponent<CharacterController>();
        animator = GetComponent<Animator> ();
    }

    // Update is called once per frame
    void Update()
    {
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;   
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");
        bool hasHorizontalInput = !Mathf.Approximately (horizontal, 0f);
        bool hasVerticalInput = !Mathf.Approximately (vertical, 0f);
        bool isWalking = hasHorizontalInput || hasVerticalInput;  
        animator.SetBool ("IsWalking", isWalking); 
        bool isTalking=myflowchart.GetBooleanVariable("IsTalking");
        bool isPlayGame=myflowchart.GetBooleanVariable("Playgame");
        if(isPlayGame)
        {
            myflowchart.SetBooleanVariable("Playgame",false);
            SceneManager.LoadScene(2);
        }
        if(controller.isGrounded)
        {
            
                move = transform.right * horizontal + transform.forward * vertical;
                move*=speed;
        }
        else
        {
            move.y-=gravity*Time.deltaTime;
        }
        if(isWalking&&!isTalking)
        {
        controller.Move(move * speed * Time.deltaTime);
        }
        if(Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
    }

}
