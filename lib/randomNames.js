import { v4 } from "uuid";





export const randDbName = () => {
  let n = v4();
  return `db_id_${n}`;
};

export const randWpName = () => {
  let n = v4();
  return `wp_id_${n}`;
};

