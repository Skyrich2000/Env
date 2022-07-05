import BasicMove from './Basic';
import EdgeMove from './Edge';
import Delete from './Delete';
import FastMove from './Fast';
import DesktopMove from './Desktop';
import NewWindow from './NewWindow';
import { Config } from 'src/config/Config';
import { Rule } from 'src/types/Rule';
import AltCommandMove from './AltCommandMove';
import AltMove from './AltMove';
import TextStyle from './TextStyle';

export default (config: Config): Rule[] => {
  const rules = [
    BasicMove, //
    EdgeMove,
    Delete,
    FastMove,
    DesktopMove,
    NewWindow,
    AltMove,
    AltCommandMove,
    TextStyle,
  ];

  return rules.map((rule) => rule(config));
};
