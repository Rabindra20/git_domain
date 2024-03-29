import logo from './logo.svg';
import './App.css';

function add(numbers) {
  var result = 0;
  var parts = numbers.split(',');
  for (var i = 0; i < parts.length; i++) {
      var integer = parseInt(parts[i]);
      if (!isNaN(integer)) {
          if (integer >= 0) {
              if (integer <= 1000) {
                  result += integer;
              }
          }
      }
  }

  return result;
}

// const greet = (firstName, lastName, greeting) => {
//   if (typeof firstName === 'string') {
//     if (typeof lastName === 'string') {
//       if (typeof greeting === 'string') {
//         return `${greeting}, ${firstName}${lastName}`;
//       }
//     }
//   }
// }
const greet = (firstName, lastName, greeting) => {
  if (typeof firstName !== 'string') {
    throw new Error('first name is required');
  }
  if (typeof lastName !== 'string') {
    throw new Error('last name is required');
  }
  if (typeof greeting !== 'string') {
    throw new Error('greeting is required');
  }
  return `${greeting}, ${firstName}${lastName}`;
}
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          {/* Edit <code>src/App.js</code> hello. */}
          <h1>Hello, welcome to .... </h1>
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
