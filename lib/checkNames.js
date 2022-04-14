import fs from 'fs'

let ar = './data/instancias.json'
let data = fs.readFileSync(ar);
let instancias = JSON.parse(data).instancias;

export const chekName = (db,wp) => {
  console.log(instancias)
  let c = 0;
  instancias.map(i=>{
    
     if(i.dbName == db){
        console.log("db iguales")
        c++
        return c;
      }

      if(i.wpName == wp){
        console.log("wp iguales")
        c++
        return c;
      }

    })

  return c;
};
