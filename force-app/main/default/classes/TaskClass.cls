public class TaskClass {

    //Opp parametresi alacak ve kurallara uyan her opp icin bir Task olusturacak
    public static void createTaskForOpp(List<Opportunity> oppList){
        
        List<Task> taskList = new List<Task>();
        
        for(Opportunity opp : oppList){
            Task newTask = new Task();
            newTask.Subject = opp.Name + ' Opportunity kontrolu gerekiyor';
            newTask.WhatId = opp.Id; //Iliskili diger object'i tanimladik
            newTask.OwnerId = opp.OwnerId;//Tasxk'i yapacak kisiyi belirledik
            tasklist.add(newTask);
        }
        if(taskList.size()>0){ // extra kontrol iyidir
            insert taskList;
        }
        
    }
    
}