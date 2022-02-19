import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function basicMove(config: Config): Manipulator[] {
  const move_left: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'h'),
    new ToEvent([], 'left_arrow'),
  );
  const move_right: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'l'),
    new ToEvent([], 'right_arrow'),
  );
  const move_up: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'k'),
    new ToEvent([], 'up_arrow'),
  );
  const move_down: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'j'),
    new ToEvent([], 'down_arrow'),
  );

  return [move_left, move_right, move_up, move_down];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('basic move (+shift) - hjkl');
  const manipulators = basicMove(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
