
import 'dart:math';

class Process {
  final String processId;
  final int arrivalTime;
  int burstTime;
  final int memorySize;
  final int priority;
   String status;

  Process(this.processId, this.arrivalTime, this.memorySize, this.priority, {required this.burstTime, required this.status});
}

void FirstComeFirstServed(List<Process> processes) {
  if (processes.isNotEmpty) {
    // Decrement the burst time of the first process in the list
    processes[0].burstTime--;
    // If the burst time of the first process becomes 0, remove it from the list
    if (processes[0].burstTime <=0) {
      //print('${processes[0].burstTime}');
      if(processes.length>1){
        processes[1].status='Running';
        processes[1].burstTime--;
      }
      processes.removeAt(0);

    }
  }
}

void ShortestJobFirst(List<Process> processes){
  if (processes.isNotEmpty) {
    int shortestIndex = 0;

    // Find the index of the process with the shortest burst time
    for (int i = 1; i < processes.length; i++) {
      if (processes[i].burstTime < processes[shortestIndex].burstTime) {
        shortestIndex = i;
      }
    }

    // Decrement the burst time
    processes[shortestIndex].burstTime--;

    // Update its status to "Running"
    processes[shortestIndex].status = 'Running';

    // Update the status of other processes to "Waiting"
    for (int i = 0; i < processes.length; i++) {
      if (i != shortestIndex) {
        processes[i].status = 'Waiting';
      }
    }

    // If the burst time of the shortest job becomes 0, remove it from the list
    if (processes[shortestIndex].burstTime == 0) {
      processes.removeAt(shortestIndex);

    }

  }
}

void PriorityScheduling(List<Process> processes){
  if (processes.isNotEmpty) {
    int priorityIndex = 0;

    // Find the index of the process with the shortest burst time
    for (int i = 1; i < processes.length; i++) {
      if (processes[i].priority < processes[priorityIndex].priority) {
        priorityIndex = i;
      }
    }

    // Decrement the burst time
    processes[priorityIndex].burstTime--;


    // Update its status to "Running"
    processes[priorityIndex].status = 'Running';

    // Update the status of other processes to "Waiting"
    for (int i = 0; i < processes.length; i++) {
      if (i != priorityIndex) {
        processes[i].status = 'Waiting';
      }
    }

    // If the burst time of the shortest job becomes 0, remove it from the list
    if (processes[priorityIndex].burstTime == 0) {
      processes.removeAt(priorityIndex);
    }

  }
}

//void RoundRobinAlgorithm(int quantumTime) {
//     // Check if the current time is within the quantum time
//     if (time <= quantumTime) {
//       time++;
//       // Check if there are processes to execute
//       if (processes.isNotEmpty) {
//         // Get the current process
//         Process currentProcess = processes[currentIndex];
//         // Check if the current process has burst time left
//         if (currentProcess.burstTime > 0) {
//           // Decrement the burst time of the current process
//           currentProcess.burstTime--;
//
//
//           if(currentProcess.burstTime==0){
//             if(currentIndex==processes.length-1){
//               processes.removeAt(currentIndex);
//               currentIndex=0;
//             }else{
//               processes.removeAt(currentIndex);
//               time = 0;
//
//             }
//           }
//
//           currentProcess.status = "Running";
//         }
//         else {
//           // Reset the time if the current process finishes
//           time = 0;
//
//           //last element
//           if(currentIndex==processes.length-1){
//             processes.removeAt(currentIndex);
//             currentIndex =0;
//           }else{
//             processes.removeAt(currentIndex);
//           }
//
//         }
//       }
//     }
//     else {
//       // Reset the time if it exceeds the quantum time
//       time = 0;
//       if (processes.isNotEmpty) {
//         if(processes[currentIndex].burstTime==0){
//           if(currentIndex==processes.length-1){
//             processes.removeAt(currentIndex);
//             currentIndex =0;
//           }else{
//             processes.removeAt(currentIndex);
//           }
//         }
//
//       }
//       processes[currentIndex].status = "Waiting";
//       currentIndex = (currentIndex + 1) % processes.length;
//     }
//   }



