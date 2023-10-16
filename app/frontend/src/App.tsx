import GeoMap from './GeoMap';

const App = () => {
  return (
    <div className="App">
      <GeoMap />
      <div className="description">
        <p className="mt-6 space-y-7 text-sm text-zinc-600 dark:text-zinc-400">
          <em>Christopher Brossman's path following the tutorial Rides</em>
          &nbsp; is based on a cool blog article - good to learn end to end app development.
          Read more at
          <a
            className="text-blue-500 hover:text-blue-600 transition-colors"
            href="https://jurajmajerik.com"
            target="_blank"
            rel="noreferrer"
          >
            &nbsp;jurajmajerik.com
          </a>
        </p>
      </div>
    </div>
  );
};

export default App;