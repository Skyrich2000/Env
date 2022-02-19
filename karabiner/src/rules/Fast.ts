import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function fastMove(config: Config): Manipulator[] {
  const move_left: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'y'),
    new ToEvent([config.v_option_key_code], 'left_arrow'),
  );
  const move_right: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'o'),
    new ToEvent([config.v_option_key_code], 'right_arrow'),
  );
  const move_up: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'i'),
  );
  '.....'.split('').forEach((_) => {
    move_up.addToEvent(new ToEvent([], 'up_arrow'));
  });
  const move_down: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'u'),
  );
  '.....'.split('').forEach((_) => {
    move_down.addToEvent(new ToEvent([], 'down_arrow'));
  });

  return [move_left, move_right, move_up, move_down];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('fast move (+shift) : yuio');
  const manipulators = fastMove(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
