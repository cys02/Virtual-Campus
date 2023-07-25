using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CharacterSelect : MonoBehaviour
{
    public GameObject[] characters;
    private  static int index = 0;
    private  static int iss = 1;
    private int s=0;

    //private GameObject[] charactershow;
    // Start is called before the first frame update
    void Start()
    {
        //charactershow = new GameObject[characters.Length];
        instantiationcharacter();
    }

    // Update is called once per frame
    void Update()
    {
        if(iss==1)
        {
            if(Input.GetKeyDown(KeyCode.A))
            {
                index--;
                if(index<0)
                {
                    index=characters.Length-1;
                }
                CharacterChange(index);
            }
            if(Input.GetKeyDown(KeyCode.D))
            {
                
                index++;
                if(index>=characters.Length)
                {
                    index=0;
                }
                CharacterChange(index);
                
            }
            if(Input.GetKeyDown(KeyCode.Return))
            {
                iss=0;
                SceneManager.LoadScene(1); 
            }
        //CharacterChange(index);
        }
        if(s==0&&iss==0)
        {
           CharacterChange(index);
           s=1; 
        }     
    }
    void CharacterChange(int _index)
    {
        for(int i=0;i<characters.Length;i++)
        {
            if(i==_index)
            {
                characters[i].SetActive(true);
            }
            else
            {
                characters[i].active=false;
            }
        }
    }
    void instantiationcharacter()
    {
        // for(int k=0;k<characters.Length;k++)
        // {
        //     charactershow[k]=(GameObject)(Instantiate(characters[k],transform.position,transform.rotation));
        // }
        CharacterChange(index);
    }
}
