import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Register() {
  const [pass, setPass] = useState("");
  const [confirm, setConfirm] = useState("");
  const [error, setError] = useState("");
  const nav = useNavigate();

  const handleRegister = () => {
    if (pass !== confirm) {
      setError("Passwords do not match");
    } else {
      nav("/");
    }
  };

  return (
    <div>
      <h2>Register</h2>

      <input placeholder="Username" />
      <br />

      <input type="password" placeholder="Password" onChange={(e) => setPass(e.target.value)} />
      <br />

      <input type="password" placeholder="Confirm Password" onChange={(e) => setConfirm(e.target.value)} />
      <br />

      <p style={{ color: "red" }}>{error}</p>

      <button onClick={handleRegister}>Register</button>
      <br />

      <button onClick={() => nav("/")}>Login</button>
    </div>
  );
}