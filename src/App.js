import logo from './logo.svg';
import './App.css';

const greet = (firstName, lastName, greeting) => {
  if (typeof firstName === 'string') {
    if (typeof lastName === 'string') {
      if (typeof greeting === 'string') {
        return `${greeting}, ${firstName}${lastName}`;
      }
    }
  }
}
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> HI.
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
