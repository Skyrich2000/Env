import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function newWindow(config: Config): Manipulator[] {
  const new_window: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'n'),
    new ToEvent([config.v_command_key_code], 'n'),
  );

  return [new_window];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('new_window (+shift) - ctrl n');
  const manipulators = newWindow(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
