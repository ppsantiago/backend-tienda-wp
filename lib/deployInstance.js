
import { exec } from "child_process";
import {chekName} from './checkNames.js'
import {randDbName,randWpName} from './randomNames.js'



let db = randDbName();
let wp = randWpName();


export const deployWP = (port,dir) => {

  if(chekName(db,wp) >= 1){
    return console.log("errrrrrrrrr")
  }
  console.log("exito2")
  


  exec(
    "script.sh " + dir + " " + db + " " + wp +" "+ port,
    (error, stdout, stderr) => {
      if (error) {
        console.log(`error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
      }
      console.log(`stdout: ${stdout}`);
    }





  );
};
