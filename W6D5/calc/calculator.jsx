import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {num1: "", num2: "", result: 0};

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);

    this.sum = this.sum.bind(this);
    this.minus = this.minus.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    let num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e) {
    let num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  sum(e) {
    e.preventDefault();
    let sum = this.state.num1 + this.state.num2;
    this.setState({ result: sum });
  }

  minus(e) {
    e.preventDefault();
    let result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    let result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  divide(e) {
    e.preventDefault();
    let result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 })
  }

  render(){
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input type="text" onChange={this.setNum1} value={num1}></input>
        <input type="text" onChange={this.setNum2} value={num2}></input>
        <br />

        <button onClick={this.sum}>+</button>
        <button onClick={this.minus}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
        <button onClick={this.clear}>clear</button>
      </div>
    );
  }
}

export default Calculator;
