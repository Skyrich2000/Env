import { Manipulator } from './Manipulator';

export class Rule {
  description: string;
  manipulators: Manipulator[] = [];

  constructor(description: string, manipulators?: Manipulator[]) {
    this.description = description;
    if (manipulators) {
      this.manipulators = manipulators;
    }
  }

  addManipulator(manipulator: Manipulator) {
    this.manipulators.push(manipulator);
  }

  addManipulators(manipulators: Manipulator[]) {
    this.manipulators.push(...manipulators);
  }
}
