import { Config } from '../config/Config';
import { FromEvent } from '../types/FromEvent';
import { Manipulator } from '../types/Manipulator';
import { Rule } from '../types/Rule';
import { ToEvent } from '../types/ToEvent';
import { applyShift } from './Utils';

function edgeMove(config: Config): Manipulator[] {
  const move_start: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'b'),
    new ToEvent([config.v_command_key_code], 'left_arrow'),
  );
  const move_end: Manipulator = new Manipulator(
    new FromEvent([config.main_key_code], 'semicolon'),
    new ToEvent([config.v_command_key_code], 'right_arrow'),
  );

  return [move_start, move_end];
}

export default (config: Config): Rule => {
  const rule: Rule = new Rule('edge move (+shift) - b;');
  const manipulators = edgeMove(config);

  rule.addManipulators([...manipulators, ...applyShift(manipulators)]);

  return rule;
};
