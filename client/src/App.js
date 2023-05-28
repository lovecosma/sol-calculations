import logo from './logo.svg';
import './App.css';
import {Nav} from "./containers/Nav";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import {Home} from "./containers/Home";
import {CalculatorContainer} from "./containers/CalculatorContainer";
function App() {
  return (
    <div className="App">
    <Router>
        <Nav/>
        <Routes>
            <Route path={"/"} element={<Home/>} />
            <Route path={"learn"} element={<h1>Learn</h1>} />
            <Route path={"calculator"} element={<CalculatorContainer/>} />
            <Route path={"about"} element={<h1>About</h1>} />
            <Route path={"account"} element={<h1>Account</h1>} />
        </Routes>
    </Router>
    </div>
  );
}

export default App;
