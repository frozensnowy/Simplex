Lua@ 	�[����AT   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua                    ����    ����   ����   ����   ����
   ����   ����   ����   ����   ����   ����   ����   ����   ���      settagmethod_hook    settagmethod    tostring_hook 	   tostring    import 	   p_import 
   p_setpath    mc_init    mc 
   numPrints    printShipsFile     	   T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua                 tag     
      method     
      tm     
      fn    
      ����       	   ���      settagmethod_hook         
      O   (  �
   �      K   �        T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua                 o           fn          ����       
   ���      tostring_hook    tag               L      B     (  �
   K      �      T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua                 tag     
      method     
      fn     
      ����       ����   	   ���      tostring_hook    settagmethod    concat        T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua                 a     	      b     	      ����       ���   	   tostring         	         B     K   B� �   �       
         �   Ԁ L      �   0   �     T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua "                file           temp          ����          ���      HW2_FullPath    dofile               L   K      �         T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua (                file     	      temp    	      ����          ���      PImportPath    HW2_FullPath    dofile         	      (  �L   �   K      �         T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua .                path           ����       ���      PImportPath                      T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua 4               	   ����    ����   ����         ���      PImportPath    HW2_FullPath    Scripts/Macros/ 	   etgJoint    EngineNozzle1    print    MACRO data path =     
ETG Spawn Pos = EngineNozzle1            L   �   �      �        L  �     �      L  �         T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua ?                file     
      temp    
      ����       	   ���      PImportPath    HW2_FullPath    dofile    .mc         
      (  �L   �   K      �   �         T   @t:\HICKORY-PCPATCH6\Homeworld2Classic\Build\DataTemp\\Scripts\utilityFunctions.lua M                 name     p      index    p      numPlayers    p   
   outstring 	   p      player '   f      playerShips *   f   	   numShips -   f      i 1   _      (limit) 1   _      (step) 1   _      ship 3   ^      shiploc 5   ^      shipor 7   ^   *   ����       ����   ����	   ����   ����   ����         ����#   '   *   ����-   1   3   5   ����7   >   B   F   J   L   Q   V   ����_   b   ����g   i   l   o   ���   	   universe    getNumPlayers    HW2_FullPath 
   numPrints    .lua    print    Writing ships file:     writeto    write    
    Writing Player      info
    -- Player      Ships
 
   getPlayer 	   getShips    count 	   position    orientation 
   addShip("    getName    "    , {    ,     },     })
 	   Success!         p   ���   N   B  �      �       L  �  �   �     �  �       G    K   �   � �L  �  K   �  �         K   G  �        �  K   B    �  B� K    B    ��    �l �K  �  �  N  �  �    �  �    B� G  �  �    �   �  �  F  �   �  �  �  �     K   �      �      �    F  �      �    �  �      G  �  � �   m��K     �R     G  � �   *���    L  �    �     ��                L   p   S      �   �   p�  �      �   0  Ԁ 0�   0  S  0� �  0  �  0�   ���S  0  �      