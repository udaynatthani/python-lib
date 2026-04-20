import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const nav = useNavigate(); // ✅ inside component

  return (
    <div>
      <h2>Login</h2>

      <input placeholder="Username" onChange={(e) => setUser(e.target.value)} />
      <br />

      <input type="password" placeholder="Password" onChange={(e) => setPass(e.target.value)} />
      <br />

      <button onClick={() => nav("/page1")}>Login</button>
      <br />

      <button onClick={() => nav("/register")}>Register</button>
    </div>
  );
}