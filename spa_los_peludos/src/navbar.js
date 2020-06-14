import React, { Component } from 'react';
import {
    Navbar,
    NavbarBrand,
    Nav,
    NavItem,
    NavLink,
} from 'reactstrap';
class NavBar extends Component {
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
                <Navbar color="faded" light expand="lg" id="navBar" fixed="top" className={this.state.isTop ? 'navTop' : 'navDown'}>
                    <NavbarBrand href="#home" id={this.state.isTop ? 'titulo-top' : 'titulo-down'}>{this.state.isTop ? 'Bienvenido a' : 'Spa Los Peludos'}</NavbarBrand>
                    <Nav navbar vertical="false">
                        <NavItem>
                            <NavLink clasName="navButton" href="#home" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Home</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink clasName="navButton" href="#about" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Acerca de nosotros</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink clasName="navButton" href="#services" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Servicios</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink clasName="navButton" href="#contact" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Contacta</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink clasName="navButton" href="#moments" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Mejores momentos</NavLink>
                        </NavItem>
                        <NavItem>
                            <NavLink clasName="navButton" href="#footer" style={this.state.isTop ? { color: '#5D5EB0' } : { color: 'white' }} active="true">Encuentranos</NavLink>
                        </NavItem>
                    </Nav>
                </Navbar>
            </div>
        )
    }
}
export default NavBar;