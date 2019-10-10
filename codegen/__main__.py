import click
import os
import yaml
from jinja2 import Environment, FileSystemLoader

_here = os.path.dirname(os.path.abspath(__file__))
j2_env = Environment(loader=FileSystemLoader(_here), trim_blocks=False)


def gen_rx_ext(cls, data):
    # if os(iOS) || os(tvOS) || os(macOS)
    need_uikit = cls.startswith('UI')
    if_os = '#if ' + ' || '.join(['os({})'.format(x) for x in data['os']])
    # MARK: Rx extension
    rx_ext = j2_env.get_template('rx_ext.j2').render(
        cls=cls, if_os=if_os, need_uikit=need_uikit,
        **data
    )
    rx_ext += '\n'
    file = '{}+Rx.swift'.format(cls)
    file_path = f'./RxTheme/Classes/RxExtensions/{file}'
    with open(file_path, 'w') as f:
        f.write(rx_ext)
    print('[*] {}'.format(file))


def gen_theme_rx(cls, data):
    # if os(iOS) || os(tvOS) || os(macOS)
    need_uikit = cls.startswith('UI')
    if_os = '#if ' + ' || '.join(['os({})'.format(x) for x in data['os']])
    # MARK: Theme extension
    theme_ext = j2_env.get_template('theme_ext.j2').render(
        cls=cls, if_os=if_os, need_uikit=need_uikit,
        **data
    )
    theme_ext += '\n'
    file = '{}+Theme.swift'.format(cls)
    file_path = f'./RxTheme/Classes/ThemeExtensions/{file}'
    with open(file_path, 'w') as f:
        f.write(theme_ext)
    print('[*] {}'.format(file))



def read_config(file):
    stream = open(f'./codegen/{file}', 'r')
    data = yaml.load_all(stream)
    return next(data)


@click.group()
def cli():
    pass


@cli.command()
def update_exts():
    for k, v in read_config('theme_exts.yml').items():
        gen_theme_rx(k, v)


@cli.command()
def show_exts():
    data = read_config('theme_exts.yml')
    lines = []
    for k, v in data.items():
        lines.append(f'##### {k}')
        lines.append('')
        for attr in v['attrs']:
            lines.append(f'- {attr}')
        lines.append('')
    content = '\n'.join(lines)
    print(content)


if __name__ == '__main__':
    cli()
