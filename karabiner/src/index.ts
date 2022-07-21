import Rules from './rules';
import { varmiloConfig } from './config/Varmilo';
import { internalConfig } from './config/Internal';
import { Modification } from './types/Modification';
import { exec } from 'child_process';

// const varmilo: Modification = new Modification(
//   varmiloConfig.title,
//   Rules(varmiloConfig),
// );

const internal: Modification = new Modification(
  internalConfig.title,
  Rules(internalConfig),
);

// https://karabiner-elements.pqrs.org/docs/json/external-json-generators/
const base64string = Buffer.from(JSON.stringify(internal)).toString('base64');
let url = `karabiner://karabiner/assets/complex_modifications/import?url=data:application/json;charset=utf-8;base64,${base64string}`;
exec(`open "${url}"`);
