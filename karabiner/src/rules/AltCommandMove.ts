import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function altCommandMove(config: Config): Manipulator[] {
  const alt_command_move_up: Manipulator = new Manipulator(
    new FromEvent(
      ['left_control', config.v_option_key_code, config.main_key_code],
      'k',
    ),
    new ToEvent(
      [config.v_option_key_code, config.v_command_key_code],
      'up_arrow',
    ),
  );
  const alt_command_move_down: Manipulator = new Manipulator(
    new FromEvent(
      ['left_control', config.v_option_key_code, config.main_key_code],
      'j',
    ),
    new ToEvent(
      [config.v_option_key_code, config.v_command_key_code],
      'down_arrow',
    ),
  );

  return [alt_command_move_up, alt_command_move_down];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('alt command move - ctrl alt jk');
  const manipulators = altCommandMove(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
