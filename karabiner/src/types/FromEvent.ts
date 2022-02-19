import { KeyCode } from './KeyCode';
import { Modifier } from './Modifier';

export class FromEvent {
  key_code: KeyCode;
  modifiers: {
    mandatory: Modifier[];
  };

  constructor(modifiers: Modifier[], key_code: KeyCode) {
    this.key_code = key_code;
    this.modifiers = { mandatory: modifiers };
  }
}
