const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  daisyui: {
    themes: [
      {
        // colors from https://www.pinterest.com/pin/344243965246793326/
        marvel: {
          "primary": "#004191", // Captain America
          "secondary": "#780000", // Iron Man
          "accent": "#1E2846", // Maria Hill
          "neutral": "#1E1E1E", // Agent Coulson
          "base-100": "#FFFFFF",
          "info": "#96EBFF", // JARVIS
          "success": "#1E4B1E", // Loki
          "warning": "#C84B19", // Black widow
          "error": "#ff0000",
        },
      },
    ],
  },

  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('daisyui'),

  ]
}
