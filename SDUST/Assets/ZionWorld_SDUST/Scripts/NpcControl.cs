using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Fungus;

public class NpcControl : MonoBehaviour
{
    public string ChatName;
    public Flowchart flowChart;

    //
    private bool canChat =false;

 
    private void OnTriggerEnter(Collider other)
    {
        canChat = true;
        Debug.Log("1");
    }

    private void OnTriggerExit(Collider other)
    {
        canChat = false;
        Debug.Log("0");
    }

    void Start()
    {
       
    }

    void Update()
    {
         if(Input.GetKeyDown(KeyCode.E))
        {
            Say();
        }
    }
    void  Say()
    {
        if(canChat)
        {
            //对话
            if(flowChart.HasBlock(ChatName))
            {
                //执行对话
                flowChart.ExecuteBlock(ChatName);
            }
        }
    }
}
