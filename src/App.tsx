import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';
import { LoginForm } from './components/auth/LoginForm';
import { DashboardLayout } from './components/dashboard/DashboardLayout';

// 👉 IMPORTA OS COMPONENTES DAS PÁGINAS
import Sellers from './components/dashboard/Sellers';
import Settings from './components/dashboard/Settings';

function App() {
  return (
    <Router>
      <Toaster position="top-right" />

      <Routes>
        {/* ROTA LOGIN */}
        <Route path="/login" element={<LoginForm />} />

        {/* ROTA DASHBOARD */}
        <Route path="/dashboard" element={<DashboardLayout />}>
          {/* ROTAS INTERNAS DENTRO DO DASHBOARD */}
          <Route path="sellers" element={<Sellers />} />
          <Route path="settings" element={<Settings />} />
        </Route>

        {/* REDIRECIONA QUALQUER OUTRO PATH PARA LOGIN */}
        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    </Router>
  );
}

export default App;


