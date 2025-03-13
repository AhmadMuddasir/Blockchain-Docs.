pragma solidity ^0.8.0;

contract SimpleStorageEx1{
     uint256[] listOfFavouriteNumbers;

     struct Person{ //struct that allows you to group multiple variables into a single unit.
     uint age;
     string name;

     }
     Person[] public listOfArray;//dynamic array because the size of the array can increase or decrease
     //now if we add [3]
     //Person[3] public listOfArray; //it will be a static array with size 3


     //instead of using this list
     Person public pat1  = Person({age:2,name:"ahmad"});
     Person public pat2  = Person({age:12,name:"ahmad1"});
     Person public pat3 = Person({age:42,name:"ahmad2"});
     Person public pat4  = Person({age:20,name:"ahmad3"});
     
     //we can use array to store all the data of list of a person

    function addPerson(string memory _name,uint _age) public{

        // Person memory newPerson = Person(_age,_name);
        // listOfArray.push(newPerson);
        // the top two lines can be written as-
        listOfArray.push(Person(_age,_name));


    }


}
