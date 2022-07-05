import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function bold(config: Config): Manipulator[] {
  const new_window: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'b'),
    new ToEvent([config.v_command_key_code], 'b'),
  );

  return [new_window];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('text style - ctrl b');
  const manipulators = bold(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
