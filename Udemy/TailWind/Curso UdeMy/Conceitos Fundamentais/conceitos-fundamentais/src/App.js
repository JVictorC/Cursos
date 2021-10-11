import './App.css';
import Components from './components/components';
import MobileFirst from './components/mobileFirst';
import PseuDoClasses from './components/pseuDoClasses';
import TudoEClasses from './components/tudoEClass';
import UtilityFirst from './components/utilityFirst';

function App() {
  return (
    <div className="App">
      <TudoEClasses />
      <UtilityFirst />
      < MobileFirst />
      <PseuDoClasses />
      <Components />
    </div>
  );
}

export default App;
