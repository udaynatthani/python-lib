import React, { useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";

export default function Page2() {
  const { state } = useLocation();
  const nav = useNavigate();

  const [data, setData] = useState({
    ssc: "",
    hsc: ""
  });

  return (
    <div>
      <h2>Page 2</h2>

      <input placeholder="SSC Marks" onChange={(e) => setData({ ...data, ssc: e.target.value })} />
      <br />

      <input placeholder="HSC Marks" onChange={(e) => setData({ ...data, hsc: e.target.value })} />
      <br />

      <button onClick={() => nav("/page1")}>Previous</button>

      <button
        onClick={() =>
          nav("/preview", {
            state: { ...state, ...data }
          })
        }
      >
        Next
      </button>
    </div>
  );
}