import React, { Component } from 'react';
import {
    Navbar,
    NavbarBrand,
    NavbarToggler,
    Collapse,
    Nav,
    NavItem,
    NavLink,
} from 'reactstrap';
class NavBar extends Component {

    constructor(props) {
        super(props);
    
        this.state = {
          isOpen: false
        };
    
        this.toggle = this.toggle.bind(this);
      }
    
      toggle() {
        this.setState({
          isOpen: !this.state.isOpen
        });
      }

    state = {
        isTop: true,
    };

    componentDidMount() {
        document.addEventListener('scroll', () => {
            const isTop = window.scrollY < 25;
            if (isTop !== this.state.isTop) {
                this.setState({ isTop })
            }
        });
    }

    render() {

        return (
            <div>
                <Navbar color="faded" light expand="lg" id="navBar" fixed="top" className={this.state.isTop&&!this.state.isOpen ? 'navTop d-flex justify-content-between' : 'navDown d-flex justify-content-between'}>
                    <NavbarBrand href="/" id={this.state.isTop&&!this.state.isOpen ? 'titulo-top' : 'titulo-down'} clasName="mr-auto">{this.state.isTop ? 'Bienvenido a' : 'Spa Los Peludos'}</NavbarBrand>
                    <NavbarToggler onClick={this.toggle} className="ml-100" style={{color:'white'}}/>
                    <Collapse isOpen={this.state.isOpen} navbar>
                        <Nav navbar vertical="false">
                            <NavItem>
                                <NavLink clasName="navButton" href="#home" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Home</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink clasName="navButton" href="#about" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Acerca de nosotros</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink clasName="navButton" href="#services" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Servicios</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink clasName="navButton" href="#contact" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Contacta</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink clasName="navButton" href="#moments" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Mejores momentos</NavLink>
                            </NavItem>
                            <NavItem>
                                <NavLink clasName="navButton" href="#footer" style={this.state.isTop&&!this.state.isOpen ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Encuentranos</NavLink>
                            </NavItem>
                        </Nav>
                    </Collapse>
                </Navbar>
            </div>
        )
    }
}
export default NavBar;