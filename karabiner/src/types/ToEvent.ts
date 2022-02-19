import { KeyCode } from './KeyCode';
import { Modifier } from './Modifier';

export class ToEvent {
  key_code: KeyCode;
  repeat: boolean;
  modifiers: Modifier[];

  constructor(
    modifiers: Modifier[],
    key_code: KeyCode,
    repeat: boolean = true,
  ) {
    this.key_code = key_code;
    this.repeat = repeat;
    this.modifiers = modifiers;
  }
}
