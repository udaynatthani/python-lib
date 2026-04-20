import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Page1() {
  const nav = useNavigate();

  const [form, setForm] = useState({
    name: "",
    mobile: "",
    branch: "",
    gender: "Male",
    skills: [],
    cgpa: 5
  });

  const toggleSkill = (skill) => {
    setForm({
      ...form,
      skills: form.skills.includes(skill)
        ? form.skills.filter((s) => s !== skill)
        : [...form.skills, skill]
    });
  };

  return (
    <div>
      <h2>Page 1</h2>

      <input placeholder="Name" onChange={(e) => setForm({ ...form, name: e.target.value })} />
      <br />

      <input placeholder="Mobile" onChange={(e) => setForm({ ...form, mobile: e.target.value })} />
      <br />

      <input placeholder="Branch" onChange={(e) => setForm({ ...form, branch: e.target.value })} />
      <br />

      <select onChange={(e) => setForm({ ...form, gender: e.target.value })}>
        <option>Male</option>
        <option>Female</option>
      </select>

      <h4>Skills</h4>
      {["C++", "Java", "Flutter"].map((skill) => (
        <label key={skill}>
          <input type="checkbox" onChange={() => toggleSkill(skill)} />
          {skill}
        </label>
      ))}

      <br />

      <input
        type="range"
        min="0"
        max="10"
        onChange={(e) => setForm({ ...form, cgpa: e.target.value })}
      />

      <br />

      <button onClick={() => nav("/page2", { state: form })}>
        Next
      </button>
    </div>
  );
}