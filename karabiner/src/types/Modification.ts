import { Rule } from './Rule';

export class Modification {
  title: string;
  rules: Rule[];

  constructor(title: string, rules: Rule[]) {
    this.title = title;
    this.rules = rules;
  }
}
