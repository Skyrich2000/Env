import BasicMove from './Basic';
import EdgeMove from './Edge';
import Delete from './Delete';
import FastMove from './Fast';
import DesktopMove from './Desktop';
import { Config } from 'src/config/Config';
import { Rule } from 'src/types/Rule';

export default (config: Config): Rule[] => {
  const rules = [
    BasicMove, //
    EdgeMove,
    Delete,
    FastMove,
    DesktopMove,
  ];

  return rules.map((rule) => rule(config));
};
