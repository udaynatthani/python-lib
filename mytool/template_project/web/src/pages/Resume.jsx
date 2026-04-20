import React from "react";
import { useLocation } from "react-router-dom";

export default function Resume() {
  const { state } = useLocation();

  return (
    <div>
      <h1>Resume</h1>
      <h2>{state.name}</h2>
      <p>Mobile: {state.mobile}</p>
      <p>Branch: {state.branch}</p>
    </div>
  );
}