import Rules from './rules';
import { Modification } from './types/Modification';
import { exec } from 'child_process';
import { defaultConfig } from './config/Internal';

const defaultModification: Modification = new Modification(
  defaultConfig.title,
  Rules(defaultConfig),
);

// https://karabiner-elements.pqrs.org/docs/json/external-json-generators/
const base64string = Buffer.from(JSON.stringify(defaultModification)).toString(
  'base64',
);
let url = `karabiner://karabiner/assets/complex_modifications/import?url=data:application/json;charset=utf-8;base64,${base64string}`;
exec(`open "${url}"`);
