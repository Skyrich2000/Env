import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';

function desktopMove(config: Config): Manipulator[] {
  const move_left: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'h'),
    new ToEvent(['left_control'], 'left_arrow'),
  );
  const move_right: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'l'),
    new ToEvent(['left_control'], 'right_arrow'),
  );
  const move_up: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'k'),
    new ToEvent(['left_control'], 'up_arrow'),
  );
  const move_down: Manipulator = new Manipulator(
    new FromEvent(['left_control', config.main_key_code], 'j'),
    new ToEvent(['left_control'], 'down_arrow'),
  );

  return [move_left, move_right, move_up, move_down];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('desktop move - ctrl hjkl');
  const manipulators = desktopMove(config);

  rule.addManipulators(manipulators);

  return rule;
};
