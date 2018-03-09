import os
import yaml
from jinja2 import Environment, FileSystemLoader

_here = os.path.dirname(os.path.abspath(__file__))
j2_env = Environment(loader=FileSystemLoader(_here),trim_blocks=False)


def run():
    stream = open('./codegen/exts.yml', 'r')
    data = yaml.load_all(stream)
    data = next(data)
    for k, v in data.items():
        gen_ext_file(k, v)


def gen_ext_file(cls, data):
    # if os(iOS) || os(tvOS) || os(macOS)
    need_uikit = cls.startswith('UI')
    if_os = '#if ' + ' || '.join(['os({})'.format(x) for x in data['os']])
    content = j2_env.get_template('ext.j2').render(
        cls=cls, if_os=if_os, need_uikit=need_uikit, **data
    )
    file = '{}+Rx.swift'.format(cls)
    file_path = './RxTheme/Classes/Extensions/{}'.format(file)
    with open(file_path, 'w') as f:
        f.write(content)
    print('[*] {}'.format(file))


if __name__ == '__main__':
    run()
