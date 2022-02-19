import { FromEvent } from './FromEvent';
import { ToEvent } from './ToEvent';

export type MantipluatorType = 'basic';

export class Manipulator {
  type: MantipluatorType;
  from: FromEvent;
  to: ToEvent[];

  constructor(from: FromEvent, to?: ToEvent, type: MantipluatorType = 'basic') {
    this.from = from;
    this.to = to ? [to] : [];
    this.type = type;
  }

  addToEvent(to: ToEvent) {
    this.to.push(to);
  }
}
