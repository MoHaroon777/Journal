/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './todo_app/templates/**/*.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Arial', 'Helvetica', 'Verdana', 'sans-serif'],
      },
    },
  },
  plugins: [],
}

