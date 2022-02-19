import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function altMove(config: Config): Manipulator[] {
  const alt_move_up: Manipulator = new Manipulator(
    new FromEvent([config.v_option_key_code, config.main_key_code], 'k'),
    new ToEvent([config.v_option_key_code], 'up_arrow'),
  );
  const alt_move_down: Manipulator = new Manipulator(
    new FromEvent([config.v_option_key_code, config.main_key_code], 'j'),
    new ToEvent([config.v_option_key_code], 'down_arrow'),
  );

  return [alt_move_up, alt_move_down];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('alt move - alt jk');
  const manipulators = altMove(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
