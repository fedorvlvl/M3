using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class description : MonoBehaviour
{

}

/*
 * baseElement - properties: 1) move slote to slote 2) start -> appear from startSlot 3) destroy in slote 4) play animation (appear, idle, destroy, tapOn, hint)
 * busterElement - properties: 1) move slote to slote 2) start -> appear from special condition 3) destroy in slote 4) play animation (appear, idle, destroy, tapOn, hint)
 * 
 * algoritm for much - when element have  (afer move) finish position, he looking arraund himself and if in order or column more then 3 elements - happens destroy this elements
 */
