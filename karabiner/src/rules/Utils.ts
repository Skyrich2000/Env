import { Manipulator } from '../types/Manipulator';

export function applyShift(manipulators: Manipulator[]): Manipulator[] {
  const shift_manipulators: Manipulator[] = JSON.parse(
    JSON.stringify(manipulators),
  );

  shift_manipulators.forEach((m) => {
    m.from.modifiers.mandatory.push('left_shift');
    m.to.forEach((e) => {
      e.modifiers.push('left_shift');
    });
  });

  return shift_manipulators;
}
