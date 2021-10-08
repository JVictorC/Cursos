
module.exports = {
  purge: ['./src/**/*.{js,jsx,ts,tsx}', './public/index.html'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
    rotate: {
      '-180': '-180deg',
      '-90': '-90deg',
     '-45': '-45deg',
     '-30': '-30deg',
     '-15': '-15deg',
      '0': '0',
      '45': '45deg',
      '90': '90deg',
     '135': '135deg',
      '180': '180deg',
     '270': '270deg',
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
