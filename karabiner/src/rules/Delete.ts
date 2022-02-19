import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function backSpace(config: Config): Manipulator[] {
  const backspace: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'n'),
    new ToEvent([], 'delete_or_backspace'),
  );
  const _delete: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'm'),
    new ToEvent(['fn'], 'delete_or_backspace'),
  );

  return [backspace, _delete];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('backspace, delete (+shift) - nm');
  const manipulators = backSpace(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
