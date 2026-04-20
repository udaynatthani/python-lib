import React from "react";
import { useLocation, useNavigate } from "react-router-dom";

export default function Preview() {
  const { state } = useLocation();
  const nav = useNavigate();

  return (
    <div>
      <h2>Preview</h2>

      <p>Name: {state.name}</p>
      <p>Mobile: {state.mobile}</p>
      <p>Branch: {state.branch}</p>
      <p>Gender: {state.gender}</p>
      <p>Skills: {state.skills?.join(", ")}</p>
      <p>CGPA: {state.cgpa}</p>
      <p>SSC: {state.ssc}</p>
      <p>HSC: {state.hsc}</p>

      <button onClick={() => nav("/resume", { state })}>
        Generate Resume
      </button>
    </div>
  );
}