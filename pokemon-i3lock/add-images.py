import os
from argparse import ArgumentParser
from PIL import Image, ImageFont, ImageDraw


def replace_dir_name(path, new_dir_name):
    new_path = path.split(os.path.sep)
    new_path[-2] = new_dir_name
    new_path = os.path.sep.join(new_path)
    return new_path


def add_text(image_path, text, save_dir_name, idx):
    try:
        img = Image.open(image_path)
        draw = ImageDraw.Draw(img)
        font = ImageFont.truetype('FiraCode-Medium.ttf', 32)
        text_w, text_h = draw.textsize(text, font=font)
        img_w, img_h = img.size
        draw.text(
            ((img_w - text_w) / 2, img_h - text_h),
            text,
            (255, 255, 255),
            font=font
        )

        img.save(replace_dir_name(image_path, save_dir_name))
        print(f'[*] {idx} Added text to: {text}')
    except Exception as e:
        print(f'[*] Error {e} in adding name to {text}')


def get_poke_name(img_path):
    return os.path.splitext(os.path.basename(img_path))[0].title()

# poke_img_path = 'pikachu.png'
# poke_name = get_poke_name(poke_img_path)
# add_text('pikachu.png', poke_name)


def readable_dir(prospective_dir):
    error = Exception(f'readable_dir:{prospective_dir} is not a valid dir')

    if not os.path.isdir(prospective_dir):
        raise error
    if os.access(prospective_dir, os.R_OK):
        return prospective_dir
    else:
        raise error


parser = ArgumentParser()
parser.add_argument(
    '-p', '--path',
    action='store',
    type=readable_dir,
    required=True,
    help='Path of the dir containing all the images.'
)

args = parser.parse_args()

NAMES_DIR = 'scrapped-data-names'

if args.path is not None:
    imgs_dir = os.path.abspath(args.path)

    # Create directory to save updated paths
    final_dir = os.path.join(os.path.dirname(imgs_dir), NAMES_DIR)
    if not (os.path.exists(final_dir) and os.path.isdir(final_dir)):
        os.mkdir(final_dir)
        print(f'[*] Created directory: {final_dir}')

    # Iterate over all the png images, add text & save to new dir
    for i, f in enumerate(os.listdir(imgs_dir), start=1):
        if os.path.splitext(f)[1] in ['.png']:
            add_text(
                image_path=os.path.join(imgs_dir, f),
                text=get_poke_name(f),
                save_dir_name=NAMES_DIR,
                idx=i
            )
        
